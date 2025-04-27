#function.py
#统计学库
from scipy.stats import chi2
#数学库
import numpy as np


#卡方分析
def stgPrb(martix):
    count = np.zeros(256,dtype=int)
    for i in range(len(martix)):
        for j in range(len(martix[0])):
            count[martix[i][j]] += 1
    h2i = count[2:255:2]
    h2is = (h2i+count[3:256:2])/2
    filter= (h2is!=0)
    k = sum(filter)
    idx = np.zeros(k,dtype=int)
    for i in range(127):
        if filter[i]==True:
            idx[sum(filter[1:i])]=i
    r=sum(((h2i[idx]-h2is[idx])**2)/(h2is[idx]))
    p = 1-chi2.cdf(r,k-1)
    return p