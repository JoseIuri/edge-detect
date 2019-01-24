# Author: Danilo Cavalcanti
# Importing System Modules
import numpy as np
import cv2 as cv
import matplotlib.pyplot as plt

# Making constants the Python way
# "Making them in a separate file and importing
# them on a main.py thing"
sKernelX=np.array([[-1,0,1],
                       [-2,0,2],
                       [-1,0,1]],np.float64)
      
sKernelY=np.array([[-1,-2,-1],
                      [0,0,0],
                      [1,2,1]],np.float64)

def sobelFilter(img=-1):
    '''Function that calculates Gx and Gy of a 3x3 img in numpy matrix form
    Arguments:
    - img: 3x3 region to process Gx and Gy
    '''
    if(type(img) != np.ndarray):
        print("Invalid 'img' parameter, returning default (0, 0)")
        return 0, 0
    elif(img.shape!=(3,3)):
        print("Invalid 'img' shape (not 3x3), returning default (0, 0)")
        return 0, 0
    elif(img.dtype != np.float64):
        print("Invalid 'img' dtype (not float64), returning default (0, 0)")
        return 0, 0
    else:           
        Gx = np.float64(0.0)
        Gy = np.float64(0.0)
        
        for i in range(3):
            for j in range(3):
                Gx += sKernelX[i][j]*img[i][j]
                Gy += sKernelY[i][j]*img[i][j]
        
        return Gx,Gy

def createEdgeImage(img=-1):
    ''' Applies Sobel filter on a NxM image "img" loaded via OpenCV (cv2 package) and
    returns three (N-2)x(M-2) images with sobelX, sobelY and both filters applied.
    2 rows and 2 columns removed to simplify boundary conditions.
    Arguments:
    - img: Region in Grayscale color scheme and np.float64 format
    '''
    if(type(img) != np.ndarray):
        print("Invalid 'img' parameter, returning empty matrix")
        return np.array([0],np.float64)
    elif(img.dtype != np.float64):
        print("Invalid 'img' dtype (not float64), returning empty matrix")
        return np.array([0],np.float64)
    else:
        # Create images ignoring last row and column for simplicity in
        # convolution operation
        x_image = np.zeros([img.shape[0]-2,img.shape[1]-2])
        y_image = np.zeros([img.shape[0]-2,img.shape[1]-2])
        
        xy_image = np.zeros([img.shape[0]-2,img.shape[1]-2])
        for i in range(1,img.shape[0]-1):
            for j in range(1,img.shape[1]-1):
                #Initialize Gx & Gy for each pixel
                Gx, Gy = 0, 0
                # Get 3x3 submatrixes with np.ix_
                # [i-1,i,i+1] = range(i-1,i+2)
                # kept explicit for clarity
                ixgrid = np.ix_([i-1,i,i+1],[j-1,j,j+1])
                workingArea = img[ixgrid]
                # Call the convolution function
                Gx, Gy = sobelFilter(workingArea)
                x_image[i-1][j-1] = Gx
                y_image[i-1][j-1] = Gy       
                # Calculate module to using root of sum of squares
                xy_image[i-1][j-1] = np.abs(Gx)+np.abs(Gy)
                
        #Normalize xy_image to range 0-255 before returning image
        maxVal = np.max(xy_image)
        xy_image = (xy_image/maxVal)*255
        
        return xy_image
    
def detectAndShow(imgpath=0):
    # path to img
    img = cv.imread(imgpath,cv.IMREAD_GRAYSCALE)


    # show image 'for visibility'
    # if color img
    #plt.imshow(cv.cvtColor(img,COLOR_BGR2RGB))
    # if gray img
    plt.imshow(img,cmap='gray')
    # take away ticks from image
    plt.xticks([])
    plt.yticks([])

    # plt.show doesn't work well with further interaction
    # taken away so users manually "plt.show()" in their terminals
    #plt.show()

    # This is where the processing begins
    xy_img = createEdgeImage(np.array(img,np.float64))

    # Convert back to Grayscale
    xy_img = np.uint8(xy_img)
    
    # Plot side by side for comparison
    plt.subplot(1,2,1), plt.imshow(img,cmap='gray')
    plt.title('Original'), plt.xticks([]), plt.yticks([])
    plt.subplot(1,2,2), plt.imshow(xy_img,cmap='gray')
    plt.title('Sobel XY'), plt.xticks([]), plt.yticks([])
    plt.show()
    
    return img,xy_img

