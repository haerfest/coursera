original = im2double(imread('digital-images-week2_quizzes-lena.gif'));

lpf3x3 = ones(3, 3) .* 1/9;
lpf5x5 = ones(5, 5) .* 1/25;

filtered3x3 = imfilter(original, lpf3x3, 'replicate');
filtered5x5 = imfilter(original, lpf5x5, 'replicate');

%
% Note that max_l = 255 for grayscale 8bpp images, but
% 1.0 for images converted to double.
%
max_l = 1.0^2;

mse3x3  = sum(sum((filtered3x3 - original) .^ 2)) / (256^2);
psnr3x3 = 10 * log10(max_l / mse3x3);

mse5x5  = sum(sum((filtered5x5 - original) .^ 2)) / (256^2);
psnr5x5 = 10 * log10(max_l / mse5x5);

fprintf("PSNR 3x3=%.2f, 5x5=%.2f", psnr3x3, psnr5x5);
