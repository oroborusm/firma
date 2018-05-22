class FirmaEmailMailer < ApplicationMailer
  default from: "Test Firma"

  def notify_firma(usuario)
    @usuario = usuario
    mail to: usuario.email, subject: "Instrucciones para firma digital"
  end
end
