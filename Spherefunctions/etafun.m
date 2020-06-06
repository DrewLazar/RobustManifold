function prob = etafun(d,epl,kappa)
fun = @(x) exp(1).^(kappa*cos(x)).*sin(x).^(d-2);
 qn = integral(fun,0,epl);  qd = integral(fun,0,pi);
prob=qn/qd; 