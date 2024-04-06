#Q1: ver arquivo RoundArithmetics.jl

#Q2: ver arquivo RoundOffErrors.jl

#Q3:
#(a)
value = pi
approximated_value = 22/7
comando = ir_absolute_error(pi,22/7)
resultado = 0.0012644892673496777

#(b)
value = pi
approximated_value = 3.1415
comando = ir_absolute_error(pi,3.1415)
resultado = 9.265358979293481e-5

#Q4:
#(a):
value = convert(Float64, factorial(7))
approximated_value = convert(Float64, sqrt(2*pi*7)*(7/ℯ)^7)
comando = relative_error(convert(Float64, factorial(7)),convert(Float64, sqrt(2*pi*7)*(7/ℯ)^7))
resultado = 0.011826223886416323

#(b):
value = convert(Float64, factorial(20))
approximated_value = convert(Float64, sqrt(2*pi*20)*(20/ℯ)^20)
comando = relative_error(convert(Float64, factorial(20)),convert(Float64, sqrt(2*pi*20)*(20/ℯ)^20))
resultado = 0.0041576526228797

#Q5:
#(a):
value = 10.0
relative_error = 10e-3
comando = approximated_value_interval_given_relative_error(10.0,10e-3)
resultado = (9.9, 10.1)

#(b):
value = 100.0
relative_error = 10e-3
comando = approximated_value_interval_given_relative_error(100.0,10e-3)
resultado = (99.0, 101.0)

#(c):
value = -50.0
relative_error = 10e-3
comando =  approximated_value_interval_given_relative_error(-50.0,10e-3)
resultado = (-50.5, -49.5)

#(d):
value = 10.0
relative_error = 10e-4
comando = approximated_value_interval_given_relative_error(10.0,10e-4)
resultado = (9.99, 10.01)

#(e):
value = 100.0
relative_error = 10e-4
comando = approximated_value_interval_given_relative_error(100.0,10e-4)
resultado = (99.9, 100.1)

#(f):
value = -50.0
relative_error = 10e-4
comando = approximated_value_interval_given_relative_error(-50.0,10e-4)
resultado = (-50.05, -49.95)
