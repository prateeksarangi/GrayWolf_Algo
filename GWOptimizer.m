function Xa = GWOptimizer(population = 10, itr = 5)

  a = 2;
  A = [2*a*rand() - a, 2*a*rand() - a, 2*a*rand() - a];
  C = [2*rand(), 2*rand(), 2*rand()];

  for i = 1:population
    X(i) = rand();
  end

  f = tan(X);

  f = sort(f, 'descend');

  Xa = atan(f(1));
  Xb = atan(f(2));
  Xd = atan(f(3));

  while(itr--)
    for i = 1:population
      Da = abs(C(1)*Xa - X(i));
      Db = abs(C(2)*Xb - X(i));
      Dd = abs(C(3)*Xd - X(i));
      
      X1 = Xa - A(1)*Da;
      X2 = Xb - A(2)*Db;
      X3 = Xd - A(3)*Dd;
      
      X(i+1) = (X1+X2+X3)/3;
     end
     
     a -= 0.4;
     A = [2*a*rand() - a, 2*a*rand() - a, 2*a*rand() - a];
     C = [2*rand(), 2*rand(), 2*rand()];
     
     f = tan(X);
     f = sort(f, 'descend');
     Xa = atan(f(1));
     Xb = atan(f(2));
     Xd = atan(f(3));
  end
  
  return;

end