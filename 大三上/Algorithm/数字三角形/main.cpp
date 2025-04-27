#include<cstdio>

int n,a[1002],i,j,ans,p;

int main(){
    scanf("%d",&n);
    
    for(i=n;i;i--){
        for(j=i;j<=n;j++){
        	scanf("%d",&p);
			a[j]=(a[j]>a[j+1]?a[j]:a[j+1])+p;
		}
	}
		     
    for(i=1;i<=n;i++){
        ans=ans>a[i]?ans:a[i];
	}
 
    printf("%d",ans);
        
    return 0;
}
