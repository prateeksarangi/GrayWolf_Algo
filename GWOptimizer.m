function Xa = GWOptimizer(population = 100, itr = 50)

  a = 2;
  A = [2*a*rand() - a, 2*a*rand() - a, 2*a*rand() - a];
  C = [2*rand(), 2*rand(), 2*rand()];

  for i = 1:population
    X(i) = rand();
  end
  
  des = 2/itr;
  f = sin(X);

  f = sort(f, 'descend');

  Xa = asin(f(1));
  Xb = asin(f(2));
  Xd = asin(f(3));

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
     
     a -= des;
     A = [2*a*rand() - a, 2*a*rand() - a, 2*a*rand() - a];
     C = [2*rand(), 2*rand(), 2*rand()];
     
     f = sin(X);
     f = sort(f, 'descend');
     Xa = asin(f(1));
     Xb = asin(f(2));
     Xd = asin(f(3));
  end
  
  return;

end