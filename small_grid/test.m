function dydt = test( t, y, u)
dydt=y*2+inp_func(u,t,2);
end
function out = inp_func(u,t, d)
out = interp1(u,t,d)
out = [
end
