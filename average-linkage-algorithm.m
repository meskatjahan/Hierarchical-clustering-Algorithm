
function average_linkage_meskat_jahan
N=[4 4; 8 4; 15 8;24 4; 24 12]
%   N=[0 0;.5 0;0 2; 2 2;2.5 8; 6 3; 7 3]
% N=[ 1 1; 1.5 1.5;5 5; 3 4;4 4 ; 3 3.5]
    [m,n]= size(N);
   for i=1:m 
           for j=1:m
                mini_dist =(N(i,1)-N(j,1))^2 +(N(i,2)-N(j,2))^2; % finding minimum distant each point
    
                    mini_dist = sqrt(mini_dist);
                    ty(i,j)=mini_dist;
       
        
           end
    end
      disp('Euclidean Distance');
    disp(ty);
        
    while 1

        [l,z]=min_dist(ty);
       [ty,z] = mini_swap(ty,l,z);
     if(l>z) te=l;
                l=z;
                z=te;
        
        end
      [d,e]=size(ty);  
        for b=2:d
            for f=1:b
              ty(b,f) = ty(f,b);
            end
         end
        
     disp('After Reducing Dimension:');
        [ty]= delete(ty,z);
        [d,e]=size(ty);
        disp(ty);
        if d==2 && e==2
           [l,z] = min_dist(ty);
            break;
        end
    end
  
end



function [my]= delete(my,z)
     my([z],:) = [];
      my(:,[z])=[];
end


 function [ty,z] = mini_swap(ty,l,z)
       
 [o,p] = size(ty);
   for j=1:o
        if  ty(l,j)>0 
          ty(l,j)=(ty(l,z)+ty(z,j))/2;
          ty(z,j)=(ty(l,z)+ty(z,j))/2;
        end
    end
      disp('After swapping:');
      disp(ty)
         
        
 end

function [l,z] = min_dist(ty)
[m,n]=size(ty);
l=0;
z=0;
mino=999999999999999;
  for i=1:m
     for j=1:m
        if  ty(i,j)<mino && ty(i,j)>0
                        mino=ty(i,j);
                        l=i;
                        z=j;
              
         end
     end
 end
disp('Average value between cluster: ');
  disp(l);
  disp(z);
end
