function update_axis(ax, xmin, xmax)
%Auto adjust axis limits based on x-axis range
xlim(ax, [xmin xmax])
axis(ax, 'auto y')
end