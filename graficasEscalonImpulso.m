clc
clear
close all

% Parámetros físicos
k1 = 3;
k2 = 5;
j = 6;
r = 1;
m = 8;

% Variables auxiliares
num = [r * k2 / (m * j)]; % Numerador
aux = (r^2 * k2 * m + m * k1 + j * k2);


% SUBAMORTIGUADO
b1 = 19.2;
den2 = [1 b1/j aux k2 * b1 / (m * j) k1 * k2 / (m * j)];
G2 = tf(num, den2);

% CRÍTICAMENTE AMORTIGUADO
b2 = 38.4;
den3 = [1 b2/j aux k2 * b2 / (m * j) k1 * k2 / (m * j)];
G3 = tf(num, den3);

% SOBREAMORTIGUADO
b3 = 57.6;
den4 = [1 b3/j aux k2 * b3 / (m * j) k1 * k2 / (m * j)];
G4 = tf(num, den4);

% Tiempo de simulación
tiempo = 0:0.01:300;

% Respuesta al escalón unitario
figure(1)
hold on
step(G2, tiempo)
step(G3, tiempo)
step(G4, tiempo)
hold off
legend("Subamortiguado", "Críticamente Amortiguado", "Sobreamortiguado")

% Respuesta al impulso
figure(2)
hold on
impulse(G2, tiempo)
impulse(G3, tiempo)
impulse(G4, tiempo)
hold off
legend("Subamortiguado", "Críticamente Amortiguado", "Sobreamortiguado")
