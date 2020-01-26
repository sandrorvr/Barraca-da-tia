class Dispositivos{

  String _mesa;
  String _produto;
  String _quantidade;
  String _status;

  Dispositivos(this._mesa,this._produto,this._quantidade,this._status);

  String get Mesa => _mesa;

  set Mesa(String value) {
    _mesa = value;
  }

  String get Produto => _produto;

  set Produto(String value) {
    _produto = value;
  }

  String get Quantidade => _quantidade;

  set Quantidade(String value) {
    _quantidade = value;
  }

  String get Status => _status;

  set Status(String value) {
    _status = value;
  }
}
