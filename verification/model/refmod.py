import numpy as np
import sys
        
sys.path.append("../../sw-sim")
        
from stoch.stochWrapper import verifSobelFilter

class refmod:
    def __init__ (self):
        pass

    def set(self, p1, p2, p3, p4, p6, p7, p8, p9):
        self.p1        = p1
        self.p2        = p2
        self.p3        = p3
        self.p4        = p4
        self.p6        = p6
        self.p7        = p7
        self.p8        = p8
        self.p9        = p9
        pass

    def sobel(self, p1, p2, p3, p4, p6, p7, p8, p9):
        self.p1        = p1
        self.p2        = p2
        self.p3        = p3
        self.p4        = p4
        self.p6        = p6
        self.p7        = p7
        self.p8        = p8
        self.p9        = p9
        
        return verifSobelFilter([self.p1,self.p2,self.p3,self.p4,self.p6,self.p7,self.p8,self.p9])
