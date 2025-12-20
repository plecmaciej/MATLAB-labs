function velocity_delta = rocket_velocity(t)
if t <= 0
        error('Wartość t musi być większa od zera.');
end
% velocity_delta - różnica pomiędzy prędkością rakiety w czasie t oraz zadaną prędkością M
% t - czas od rozpoczęcia lotu rakiety dla którego ma być wyznaczona prędkość rakiety
M = 750; % [m/s]
g = 1.622;
mo=150000;
u=2000;
q=2700; 
v = u*log(mo/(mo-q*t)) - g * t;
velocity_delta = v - M;

end
