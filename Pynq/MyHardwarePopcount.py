import numpy as np

from pynq import Overlay
from pynq import MMIO

class MyHardwarePopcount():
    
    def __init__(self):
        # UNCOMMENT
        #self.overlay = Overlay('bitstream.bit')        
        #self.mmio = self.overlay.axi_popcount_0.S_AXI_LITE
        pass

    def name(self):
        return "Hardware_Popcount"
    
    def countInt(self, n): 
        # FILL ME IN!
        return 0
    
    def countArray (self, buf):
        total_ones = 0
        for b in buf:
            total_ones += self.countInt(b)
        return total_ones
        
    def countFile(self,file):
        f = open(file, "r")
        buf = np.fromfile(f, dtype=np.uint32)
        return self.countArray(buf) 


