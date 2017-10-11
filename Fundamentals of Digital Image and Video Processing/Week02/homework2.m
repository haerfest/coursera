original = imread('digital-images-week2_quizzes-lena.gif');
as_double = im2double(original);

lpf3x3 = [
    1/9, 1/9, 1/9;
    1/9, 1/9, 1/9;
    1/9, 1/9, 1/9
];

lpf5x5 = [
    1/25, 1/25, 1/25, 1/25, 1/25;
    1/25, 1/25, 1/25, 1/25, 1/25;
    1/25, 1/25, 1/25, 1/25, 1/25;
    1/25, 1/25, 1/25, 1/25, 1/25;
    1/25, 1/25, 1/25, 1/25, 1/25
];

filtered3x3 = imfilter(as_double, lpf3x3, 'replicate');
filtered5x5 = imfilter(as_double, lpf5x5, 'replicate');

max_l = 255^2;
mse3x3  = sum(sum((filtered3x3 - as_double) .^ 2)) / (256^2);
psnr3x3 = 10 * log10(max_l / mse3x3);

mse5x5  = sum(sum((filtered5x5 - as_double) .^ 2)) / (256^2);
psnr5x5 = 10 * log10(max_l / mse5x5);
