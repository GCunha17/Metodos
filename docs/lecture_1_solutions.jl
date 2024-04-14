using NumericalAnalysis: round_sum, round_mul, trunc_sum, trunc_mul, absolute_error, relative_error, approximated_value_interval_given_relative_error, ir_absolute_error, ir_relative_error

#Q1: ver arquivo RoundArithmetics.jl

#Q2: ver arquivo RoundOffErrors.jl

#Q3:
#(a)
value : pi
approximated_value : 22/7
comando : ir_absolute_error(pi,22/7)
resultado : 0.0012644892673496777

#(b)
value : pi
approximated_value : 3.1415
comando : ir_absolute_error(pi,3.1415)
resultado : 9.265358979293481e-5

#Q4:
#(a):
value : convert(Float64, factorial(7))
approximated_value : convert(Float64, sqrt(2*pi*7)*(7/ℯ)^7)
comando : relative_error(convert(Float64, factorial(7)),convert(Float64, sqrt(2*pi*7)*(7/ℯ)^7))
resultado : 0.011826223886416323

#(b):
value : convert(Float64, factorial(20))
approximated_value : convert(Float64, sqrt(2*pi*20)*(20/ℯ)^20)
comando : relative_error(convert(Float64, factorial(20)),convert(Float64, sqrt(2*pi*20)*(20/ℯ)^20))
resultado : 0.0041576526228797

#Q5:
#(a):
value : 10.0
relative_error : 10e-3
comando : approximated_value_interval_given_relative_error(10.0,10e-3)
resultado : (9.9, 10.1)

#(b):
value : 100.0
relative_error : 10e-3
comando : approximated_value_interval_given_relative_error(100.0,10e-3)
resultado : (99.0, 101.0)

#(c):
value : -50.0
relative_error : 10e-3
comando :  approximated_value_interval_given_relative_error(-50.0,10e-3)
resultado : (-50.5, -49.5)

#(d):
value : 10.0
relative_error : 10e-4
comando : approximated_value_interval_given_relative_error(10.0,10e-4)
resultado : (9.99, 10.01)

#(e):
value : 100.0
relative_error : 10e-4
comando : approximated_value_interval_given_relative_error(100.0,10e-4)
resultado : (99.9, 100.1)

#(f):
value : -50.0
relative_error : 10e-4
comando : approximated_value_interval_given_relative_error(-50.0,10e-4)
resultado : (-50.05, -49.95)

#Q6:
#calculando o valor da expressão original:
comando : (13/14 - 6/7)/(2/ℯ - 5.4)
#obs: acima, utilizei de \euler + tab para obter ℯ
resultado : -0.015314082103982359
r = -0.015314082103982359
#calculando o valor da expressão utilizando a aproximação com trunc com 10 dígitos:
comando : trunc((trunc_sum(13/14,-6/7,digits:10))/(trunc_sum(2/ℯ,-5.4,digits:10)),digits:10)
resultado : -0.015314082
t = -0.015314082
#calculando o valor da expressão utilizando a aproximação com round com 10 dígitos:
comando : round((round_sum(13/14,-6/7,digits:10))/(round_sum(2/ℯ,-5.4,digits:10)),digits:10)
resultado : -0.0153140821
a = -0.0153140821
#calculando erro absoluto e relativo de cada:
#truncamento:
comando : relative_error(r,t)
resultado : 6.789983132868875e-9
comando : absolute_error(r,t)
resultado : 1.039823591814093e-10
#arredondamento:
comando : relative_error(r,a)
resultado : 2.600455942412628e-10
comando : absolute_error(r,a)
resultado : 3.982359580989581e-12