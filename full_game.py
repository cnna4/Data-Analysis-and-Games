#!/usr/bin/env python
# coding: utf-8

# ## The Game

# In[1]:


from Game import *

from robot_movement2 import *

# In[2]:


print("TTT Version: 0.0.3")


# In[3]:


def initial_state():
    state=Board(3,3)
    state.pieces=[".","X","O"]
    return state

def show_state(state):
    print(state)
    
def valid_moves(state,player):
    
    moves=[]
    for location in range(9):
        if state[location]==0:
            moves.append(location)
            
    return moves  

def update_state(state,player,move):
    new_state=state
    
    new_state[move]=player
    return new_state    
    
def win_status(state,player):

    for start,middle,end in [
        [0,1,2],[3,4,5],[6,7,8],
        [0,3,6],[1,4,7],[2,5,8],
        [0,4,8],[2,4,6],
                ]:
        
        if state[start]==player and state[middle]==player and state[end]==player:
            return "win"
        
    if player==1:
        other_player=2
    else:
        other_player=1
    
    if not valid_moves(state,other_player):
        return "stalemate"


# In[4]:


def human_move(state,player):
    
    state.show_locations()
    print("Player",player)
    move=int(input("which square to place your piece?"))
    return move

human_agent=Agent(human_move) 

def random_move(state,player):
    
    move=random.choice(valid_moves(state,player))
    return move


random_agent=Agent(random_move)


# ## Get Move

# In[5]:


from Game.minimax import *
def minimax_move(state,player):

    values,moves=minimax_values(state,player,display=True)
    return top_choice(moves,values)

def get_move(state,player):
    return minimax_move(state,player)


# In[6]:


state=initial_state()


# In[7]:


get_move(state,1)


# ## Make Move

# In[8]:


def make_move(move):
    print("If I could move, I would do move: ",move)


# In[9]:


def go_forward(distance):
    print("forward ",distance)
    
def go_backward(distance):
    print("backward ",distance)    
    
def turn_left(degree):
    print("left",degree)
    
def turn_right(degree):
    print("right",degree)       
    
def armup():
    print("arm up")
def armdown():
    print("arm down")


# In[10]:


def make_move(move):
    print("Making move ",move)
    
    board=Board(3,3)  # just to get the conversion functions for free
    

    if move==0:
        box0()
        # go back
        box0return()


    elif move==1:  
        box1()

        # go back
        box1return()
        
    elif move==2:  
        box2()

        # go back
        box2return()
    
    elif move==3:  
        box3()

        # go back
        box3return()
        
    elif move==4:  
        box4()
        
        #go back
        box4return()
        
    elif move==5:  
        box5()

        # go back
        box5return()
        
    elif move==6:  
        box6()

        # go back
        box6return()
        
    elif move==7:  
        box7()

        # go back
        box7return()
        
    elif move==8:  
        box8()

        # go back
        box8return()
        

    else:
        raise ValueError("You can't get there from here.")


# ## Read State

# In[11]:


def read_state_from_file(filename='current_board.txt'):
    with open(filename) as fid:
        text=fid.read()

    text2=text.strip().split('\n')
    number_of_rows=len(text2)
    number_of_cols=len(text2[0].split())
    
    b=Board(number_of_rows,number_of_cols)
        
    board=[int(v) for v in text.split()]
    b.board=board
    return b


# In[12]:


def read_state():
    state=read_state_from_file()
    return state



# In[14]:


state=read_state()
show_state(state)


# In[15]:


from classy import *


# In[16]:


def take_picture(fname):
    pass

def get_square(arr,index,shape,locations=None):
    import json
    
    if locations is None:
        with open('locations.json') as json_file:
            locations = json.load(json_file)        
    
    try:
        location=locations[index]
    except IndexError:
        print("locations.json file probably corrupt.")
        raise 
        
    c,r=location
    c1=int(c-shape[1]/2)
    c2=int(c+shape[1]/2)
    r1=int(r-shape[0]/2)
    r2=int(r+shape[0]/2)

    c2=c2+(shape[1]-(c2-c1))
    r2=r2+(shape[0]-(r2-r1))

    square=arr[r1:r2,c1:c2,:]
    
    return square


# In[17]:


from pylab import imread,imsave


# In[18]:


def read_state():
    from pylab import imread,imsave
    import os

    # train the classifier
    images=image.load_images('images/all_pieces',delete_alpha=True)
    shape=images.data[0].shape[:2]
    data_train=data=image.images_to_vectors(images,verbose=True)  # train on all of them

    #classifier=kNearestNeighbor()
    classifier=NaiveBayes()
    classifier.fit(data_train.vectors,data_train.targets)


    # get the picture
    take_picture('current_board.jpg')
    arr=imread('current_board.jpg')


    # slice the picture into squares of the right size
    shape=data_train.shape[:2]
    squares=[get_square(arr,i,shape) for i in range(9)]
    test_images=image.array_to_image_struct(squares)

    # get predictions
    test_data=image.images_to_vectors(test_images)
    predictions=classifier.predict(test_data.vectors)

    if not os.path.exists('images/predicted'):
        os.mkdir('images/predicted')
    for i,(square,prediction) in enumerate(zip(squares,predictions)):
        imsave('images/predicted/square %d predicted as %s.jpg' % (i,data_train.target_names[prediction]),square)

    
    # reconstruct the state from the predictions
    state=Board(3,3)
    for i in range(9):
        color=data_train.target_names[predictions[i]]
        if color=="white":
            state[i]=0
        elif color=="red":
            state[i]=1
        elif color=="yellow":
            state[i]=2
        else:
            raise ValueError("You can't get there from here.")


    state=read_state_from_file()

    print("current state is:")
    print(state)

    
    return state


# In[19]:


#state=read_state()


# In[20]:


state=read_state()     #  read the state from the world
move=get_move(state,2)   # from an agent
make_move(move)        # robot motion to move pieces, etc...


# In[ ]:




