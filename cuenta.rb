class Cuenta

  def initialize
    @saldo = 0
  end

  def saldo
    @saldo
  end

  def depositar importe
    @saldo += importe
  end

  def extraer importe
    if importe <= @saldo
      @saldo -= importe
    else
      raise ArgumentError, "Saldo insuficiente"
    end
  end

  def transferir destino, importe

    extraer importe
    begin
      destino.depositar importe
    rescue
      depositar importe
      raise ArgumentError, "Cuenta destino inválida"
    end
  end
end
