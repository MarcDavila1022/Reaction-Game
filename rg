"""
Imported my main modules, turtle to create objects and applications, time to create a timer, and random to
randomize the position of the object.
"""
import turtle
import time
import random


#Creates the variables necessary for the code
s = False 
clicks = 0
t = 20
x = random.randint(-250, 250)
y = random.randint(-250,250)


#Created the beginning screen and setted up how the screen will look like
start = turtle.Screen() 
start.title("Reaction Game") 
start.bgcolor('lightgrey')
start.setup(width = 600, height = 600) 
start.tracer(0)


#Created a text that notifies the user how to start the game
s_screen = turtle.Turtle() 
s_screen.speed(0) 
s_screen.color('white')
s_screen.penup() 
s_screen.hideturtle()
s_screen.goto(0,0)
s_screen.write("Press S to Start Game", align = "center",font= ('Times New Roman', 24, 'normal') )


# Creates the amount score that the user got when the 20 seconds go by.
pen = turtle.Turtle()
pen.speed(0) 
pen.color('black') 
pen.penup()
pen.hideturtle()
pen.goto(0,0)  


# Creates the text for the restart screen.
# This will be used after the user goes through one round of clicking the squares
restart_b = turtle.Turtle() 
restart_b.speed(0) 
restart_b.color('black')
restart_b.penup()
restart_b.hideturtle()
restart_b.goto(0,-200) 

# Creates the Blue Square/target
target = turtle.Turtle()
target.speed(0)
target.shape('square')
target.hideturtle()
target.shapesize(stretch_wid =2, stretch_len=2 ) 
target.color('blue') 
target.penup() 
target.goto(x,y)


def begin():
    """
    Begins the game when the user clicks s. Clears the previous screen
    Additionally sets up the time module.
    """


    global python_time
    global s
    global clicks
    s_screen.clear()
    python_time = time.time()
    s = True
    clicks = 0


def newpos(xpos, ypos):
    """
    Randomly creates a new x and y coordiante for the blue square.
    Adds the amount of clicks by 1
    """


    global clicks
    target.setx(random.randint(-250, 250))
    target.sety(random.randint(-250, 250))
    
    clicks += 1

def restart():
    """
    Outputs the game over screeen
    Also, hides the target and writes the following steps to restart the game.
    """


    x = "Your reaction speed is " + str(round((t*1000)/clicks, 2))
    target.hideturtle()
    pen.write(x + " milliseconds", align = 'center', font= ('Times New Roman', 24, 'normal'))
    restart_b.write("Click s to start again", align = 'center', font= ('Times New Roman', 24, 'normal'))
    

start.listen()
start.onkeypress(begin, 's')


while True:
    """
    While loop that updates game and checks if there s is true/ starts the game.
    """


    start.update()
    if s == True:
        pen.clear()
        restart_b.clear()
        target.showturtle()
        target.onclick(newpos)
        game_time = time.time() - python_time
        countdown = round(t - game_time) 
        
        if countdown <= 0:
            s = "Try again"

    elif s == "Try again":
        restart()
        
        



