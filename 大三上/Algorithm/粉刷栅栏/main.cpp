#include <bits/stdc++.h>
using namespace std;

const int maxn = 5e3 + 5; // 最大栅栏长度
int h[maxn]; // 栅栏高度数组

// 递归函数 dfs，计算区间 [l, r] 的最少粉刷次数
int dfs(int l, int r){
    if(l > r) return 0; // 基本情况：如果区间无效，返回 0

    int minx = 1e9, ans = 0, pre = l; // minx 为当前区间最小值，ans 累积粉刷次数，pre 标记子区间起点
    
    // 找到区间 [l, r] 中的最小高度 minx
    for(int i = l; i <= r; i++){
    	minx = min(minx, h[i]);
	}
    
    // 将区间内的每个高度减去 minx，实现横向粉刷 minx 次
    for(int i = l; i <= r; i++){
    	h[i] -= minx;
	}
	
    ans += minx; // 横向粉刷 minx 次

    // 遍历区间，按高度是否为 0 划分子区间递归处理
    for(int i = l; i <= r; i++){
        if(h[i] == 0){ // 遇到高度为 0 的位置
            ans += dfs(pre, i-1); // 递归处理前一个子区间 [pre, i-1]
            pre = i + 1; // 更新下一个子区间的起点
        }
        else if(i == r) {
            ans += dfs(pre, r); // 处理最后一个子区间
        }
    }
    
    return min(ans, r - l + 1); // 返回横向粉刷和纵向粉刷的较小值
}

int main(){
    int n;
    while(~scanf("%d", &n)){ // 持续读取输入数据
        for(int i = 1; i <= n; i++){
            scanf("%d", &h[i]); // 读取每个栅栏的高度
        }
        printf("%d\n", dfs(1, n)); // 输出最少粉刷次数
    }
    return 0;
}

