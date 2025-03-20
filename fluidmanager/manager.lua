x = {...}
task = x[1]

while true do
    count = task.count / #task.from
    for i,k in pairs(task.from) do
        peripheral.call(k, "pushFluid", task.to, count)
    end
    os.sleep(task.sleep)
end