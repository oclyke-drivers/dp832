from dp832 import dp832

port='/dev/usbtmc1'

d = dp832(port)

channel = 1

print(d.isConnected())
print(d.GetState(channel))

# d.SetVoltage(channel, 0.0)
# d.SetCurrent(channel, 0.5)
# d.On(channel)
# d.Off(channel)



