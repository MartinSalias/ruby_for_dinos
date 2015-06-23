require 'minitest/autorun'

require_relative './cuenta.rb'

class TestCuenta < Minitest::Unit::TestCase

  def setup
    @martin = Cuenta.new
  end

  def test_cuenta_con_saldo_cero
    assert_equal 0, @martin.saldo
  end

  def test_saldo_100_despues_de_depositar_100
    @martin.depositar 100
    assert_equal 100, @martin.saldo
  end

  def test_saldo_30_despues_de_depositar_100_y_extraer_70
    @martin.depositar 100
    @martin.extraer 70
    assert_equal 30, @martin.saldo
  end

  def test_excepcion_si_trato_de_extraer_mas_que_el_saldo
    @martin.depositar 100
    assert_raises (ArgumentError) {@martin.extraer 300}
  end

  def test_transfiero_100_de_A_a_B
    hiro = Cuenta.new
    @martin.depositar 120

    @martin.transferir hiro, 100

    assert_equal 20, @martin.saldo
    assert_equal 100, hiro.saldo
  end

  def test_transfiero_a_algo_que_no_es_una_cuenta
    @martin.depositar 120

    assert_raises (ArgumentError) do
      @martin.transferir "nada", 100
    end
  end
end
