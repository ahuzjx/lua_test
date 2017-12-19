Account={
    balance=0,
    withdraw=function(self,v)
        self.balance=self.balance-v
    end
}

function Account:deposite(v)
    self.balance=self.balance+v
end

function Account:new(o)
    o=o or {}
    setmetatable(o, self)
    self.__index=self
    return o
end

Account.deposite(Account,200.00)
Account:withdraw(100.00)
print(Account.balance)

