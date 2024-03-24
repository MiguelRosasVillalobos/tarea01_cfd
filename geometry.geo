lc = 0.02;
l = 1.5;
h = 0.5;
r = 0.05;
//+
Point(1) = {0, 0, 0,lc};
//+
Point(2) = {l, 0, 0,lc};
//+
Point(3) = {l, h, 0,lc};
//+
Point(4) = {0, h, 0,lc};
//+
Line(1) = {1, 2};
//+
Line(2) = {2, 3};
//+
Line(3) = {3, 4};
//+
Line(4) = {4, 1};
//+
Point(5) = {l/3+2*r, h/2, 0,lc};
//+
Point(6) = {l/3+r, h/2, 0,lc};
//+
Point(7) = {l/3, h/2, 0,lc};
//+
Point(8) = {l/3 + r, h/2+r, 0,lc};
//+
Point(9) = {l/3 + r, h/2-r, 0,lc};
//+
Circle(5) = {8, 6, 7};
//+
Circle(6) = {7, 6, 9};
//+
Circle(7) = {9, 6, 5};
//+
Circle(8) = {5, 6, 8};
//+
Curve Loop(7) = {5, 6, 7, 8};
//+
Curve Loop(8) = {4, 1, 2, 3};
//+
Plane Surface(2) = {8,7};
//+
Transfinite Surface {1};
Recombine Surface {1};

Extrude {0, 0, 0.01} {
  Surface{2}; Layers{5}; Recombine; 
}
Transfinite Volume {1};
//+
Physical Surface("inlet", 1) = {21};
//+
Physical Surface("outlet", 2) = {29};
//+
Physical Volume("interior", 1) = {1};
//+
Physical Surface("sides", 3) = {50, 2};
//+
Physical Surface("Wall", 4) = {25, 33, 37, 41, 45, 49};
//+
