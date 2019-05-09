/*
 * 	startup.c
 *  
 */
#include "libGPIO.h"
#include "libdelay.h"
#include "graphics.h"
#include <stdint.h>

#define MAX_POINTS 20



typedef struct tpoint {
    uint8_t x;
    uint8_t y;
}POINT;

typedef struct tShape {
    uint8_t numPoints;
    POINT size;
    POINT points[MAX_POINTS];
}SHAPE;

typedef struct tObj {
    SHAPE* shape;
    POINT velocity;
    POINT position;
    void (* draw) (struct tObj*);
    void (* clear) (struct tObj*);
    void (* move) (struct tObj*);
    void (* set_speed) (struct tObj*, POINT);
}OBJECT;

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}



void draw_object(OBJECT* self) {
    SHAPE* shape = self->shape;
    for (uint8_t i = 0; i < shape->numPoints; i++) {
        uint8_t x = shape->points[i].x;
        uint8_t y = shape->points[i].y;
        uint8_t px = self->position.x;
        uint8_t py = self->position.y;
        pixel(x + px, y + py, true);
    }
}

void clear_object(OBJECT* self) {
    SHAPE* shape = self->shape;
    for (uint8_t i = 0; i < shape->numPoints; i++) {
        uint8_t x = shape->points[i].x;
        uint8_t y = shape->points[i].y;
        uint8_t px = self->position.x;
        uint8_t py = self->position.y;
        pixel(x + px, y + py, false);
    }
}

void set_speed(OBJECT* self, POINT velocity) {
    self->velocity = velocity;
}

void move_object(OBJECT* self) {
    uint8_t newX = self->position.x + self->velocity.x;
    uint8_t newY = self->position.y + self->velocity.y;
    bool shouldIMove = true;
    
    if (newX < 1 || newX > 128) {
        self->velocity.x = -self->velocity.x;
        shouldIMove = false;
    }
    if (newY < 1 || newY > 64) {
        self->velocity.y = -self->velocity.y;
        shouldIMove = false;
    }
    if (self->velocity.x == 0 && self->velocity.y == 0) {
        shouldIMove = false;
        
    }
    if (shouldIMove) {
        self->clear(self);
        self->position.x = newX;
        self->position.y = newY;
        self->draw(self);
    }
    
}



void app_init(void) {
    GPIO_E->moder = 0x55555555;
    GPIO_init_keypad(GPIO_D, false);
}

int main(void)
{
    app_init();
    graphic_init();
    #ifndef SIMULATOR
        graphic_clear_screen();
    #endif
    
    static SHAPE ball_geometry = {
        12,
        {10,10},
        {
                   {0,1}, {0,2}, 
            {1,0}, {1,1}, {1,2}, {1,3}, 
            {2,0}, {2,1}, {2,2}, {2,3},
                   {3,1}, {3,2}
        }
    };
    
    static OBJECT ball = {
        &ball_geometry,
        {4,4},
        {1,1},
        draw_object,
        clear_object,
        move_object,
        set_speed
    };
    uint8_t c;
    while (true) {
        ball.move(&ball);
        c = GPIO_read_keypad(GPIO_D, false);
        switch (c) {
            case 5:
                ball.set_speed(&ball, (POINT){0,0});
            case 6:
                ball.set_speed(&ball, (POINT){2,0});
                break;
            case 4:
                ball.set_speed(&ball, (POINT){-2,0});
                break;
            case 2:
                ball.set_speed(&ball, (POINT){0,-2});
                break;
            case 8:
                ball.set_speed(&ball, (POINT){0,2});
                break;
        }
        
    }
    return 0;
}

