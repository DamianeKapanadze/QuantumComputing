% plotBlochSphere.m

[Xs, Ys, Zs] = sphere (25);
%Make a sphere
mySphere = surf( Xs, Ys, Zs); 
%make more spherical
axis equal 
shading interp
mySphere.FaceAlpha = 0.25;

line([-1 1], [0 0], [0 0], 'LineWidth', 1, 'Color', [0 0 0])
line([0 0], [-1 1], [0 0], 'LineWidth', 1, 'Color', [0 0 0])
line([0 0], [0 0], [-1 1], 'LineWidth', 1, 'Color', [0 0 0])

text( 0, 0, 1.1, '$\left| 0 \right>$', 'Interpreter', 'latex', 'FontSize', 20, 'HorizontalAlignment', 'Center')
text( 1.1, 0, 0, '$\left| + \right>$', 'Interpreter', 'latex', 'FontSize', 20, 'HorizontalAlignment', 'Center')
text( -1.1, 0, 0, '$\left| - \right>$', 'Interpreter', 'latex', 'FontSize', 20, 'HorizontalAlignment', 'Center')

view([60 15])

text( 0, 0, -1.1, '$\left| 1 \right>$', 'Interpreter', 'latex', 'FontSize', 20, 'HorizontalAlignment', 'Center')
