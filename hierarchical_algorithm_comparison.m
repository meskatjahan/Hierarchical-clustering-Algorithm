
function Tanu = hierarchical_algorithm_meskat

b = xlsread('meskat-hierarchical_exercise.xlsx'); %read excel data

subplot(2,2,1)

% plot(b(:,1),b(:,2),'r.','MarkerSize',18)
plot(b(:,1),b(:,2),'rs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',10)
            title('.Comparative View of Hierarchical Clustering Algorithm.....Initial Data Set')
     xlabel('object number in original x')
ylabel('distance')      

 
Z = linkage_meskat
Z1 = complete_linkage_meskat
Z3 = average_linkage_meskat


end
function [Z] = linkage_meskat
b = xlsread('meskat-hierarchical_exercise.xlsx'); %read excel data


d = pdist(b);
% d = pdist(b,'cityblock');   %D = pdist(X) computes the Euclidean distance between pairs of objects in m-by-n data matrix X. Rows of X correspond to observations, and columns correspond to variables. D is a row vector of length m(m–1)/2, corresponding to pairs of observations in X. The distances are arranged in the order (2,1), (3,1), ..., (m,1), (3,2), ..., (m,2), ..., (m,m–1)). D is commonly used as a dissimilarity matrix in clustering or multidimensional scaling.
distance_matrix = squareform (d) %Format distance matrix
%  = disp( d2);
 
Z = linkage(d,'single');  %linkage(X,method) creates the tree using the specified method, where method describes how to measure the distance between clusters.
 c = cluster(Z,'maxclust',2)  %cluster(Z,'maxclust',n) constructs a maximum of n clusters using the 'distance' criterion. cluster finds the smallest height at which a horizontal cut through the tree leaves n or fewer clusters.
c2= cluster(Z,'cutoff',0.4,'criterion','distance') %cluster(Z,'cutoff',c,'criterion',criterion) uses the specified criterion for forming clusters, where criterion is one of the strings 'inconsistent' (default) or 'distance'. The 'distance' criterion uses the distance between the two subnodes merged at a node to measure node height. All leaves at or below a node with height less than c are grouped into a cluster.
  subplot(2,2,2);
H=dendrogram(Z,'ColorThreshold','default')

title('.....Hierarchical Clustering using Single Linkage Algorithm.....')
xlabel('object number in original x')
ylabel('distance')
set(H,'LineWidth',5)


end

function [Z1] = complete_linkage_meskat
b1 = xlsread('meskat-hierarchical_exercise.xlsx'); %read excel data


d1 = pdist(b1);
% d1 = pdist(b1,'cityblock');   %D = pdist(X) computes the Euclidean distance between pairs of objects in m-by-n data matrix X. Rows of X correspond to observations, and columns correspond to variables. D is a row vector of length m(m–1)/2, corresponding to pairs of observations in X. The distances are arranged in the order (2,1), (3,1), ..., (m,1), (3,2), ..., (m,2), ..., (m,m–1)). D is commonly used as a dissimilarity matrix in clustering or multidimensional scaling.
distance_matrix1 = squareform (d1) %Format distance matrix
%  = disp( d2);
 
Z1 = linkage(d1,'complete');  %linkage(X,method) creates the tree using the specified method, where method describes how to measure the distance between clusters.
 c45 = cluster(Z1,'maxclust',2)  %cluster(Z,'maxclust',n) constructs a maximum of n clusters using the 'distance' criterion. cluster finds the smallest height at which a horizontal cut through the tree leaves n or fewer clusters.
c29= cluster(Z1,'cutoff',0.4,'criterion','distance') %cluster(Z,'cutoff',c,'criterion',criterion) uses the specified criterion for forming clusters, where criterion is one of the strings 'inconsistent' (default) or 'distance'. The 'distance' criterion uses the distance between the two subnodes merged at a node to measure node height. All leaves at or below a node with height less than c are grouped into a cluster.
  subplot(2,2,3);
H1=dendrogram(Z1,'ColorThreshold','default')

title('.....Hierarchical Clustering using Complete Linkage Algorithm.....')
xlabel('object number in original x')
ylabel('distance')
set(H1,'LineWidth',5)


end

function [Z3] = average_linkage_meskat
b3 = xlsread('meskat-hierarchical_exercise.xlsx'); %read excel data


d3 = pdist(b3);
% d3 = pdist(b3,'cityblock');   %D = pdist(X) computes the Euclidean distance between pairs of objects in m-by-n data matrix X. Rows of X correspond to observations, and columns correspond to variables. D is a row vector of length m(m–1)/2, corresponding to pairs of observations in X. The distances are arranged in the order (2,1), (3,1), ..., (m,1), (3,2), ..., (m,2), ..., (m,m–1)). D is commonly used as a dissimilarity matrix in clustering or multidimensional scaling.
distance_matrix3 = squareform (d3) %Format distance matrix 
Z3 = linkage(d3,'average');  %linkage(X,method) creates the tree using the specified method, where method describes how to measure the distance between clusters.
 c3 = cluster(Z3,'maxclust',2)  %cluster(Z,'maxclust',n) constructs a maximum of n clusters using the 'distance' criterion. cluster finds the smallest height at which a horizontal cut through the tree leaves n or fewer clusters.
c6= cluster(Z3,'cutoff',0.4,'criterion','distance') %cluster(Z,'cutoff',c,'criterion',criterion) uses the specified criterion for forming clusters, where criterion is one of the strings 'inconsistent' (default) or 'distance'. The 'distance' criterion uses the distance between the two subnodes merged at a node to measure node height. All leaves at or below a node with height less than c are grouped into a cluster.
  subplot(2,2,4);
H3=dendrogram(Z3,'ColorThreshold','default')

title('.....Hierarchical Clustering using Average Linkage Algorithm.....')
xlabel('object number in original x')
ylabel('distance')
set(H3,'LineWidth',5)


end
