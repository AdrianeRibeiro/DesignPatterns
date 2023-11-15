# Neste exemplo, a classe EmailProvider representa a implementação dos provedores de e-mail.
# As classes concretas GmailProvider e OutlookProvider são implementações para provedores específicos.
# As classes EmailClient representam a abstração do cliente de e-mail. 
# As classes EmailClientGmail e EmailClientOutlook são abstrações concretas que usam uma implementação específica para enviar e-mails. 

# Implementação: Provedor de e-mail
class EmailProvider
    def enviar_email(para, assunto, corpo)
        raise NotImplementedError, "Método 'enviar_email' deve ser implementado na classe filha"
    end
end
  
# Implementações concretas para provedores de e-mail
class GmailProvider < EmailProvider
    def enviar_email(para, assunto, corpo)
        puts "Enviando e-mail pelo Gmail"
        puts "Para: #{para} \n"
        puts "Assunto: #{assunto} \n"
        puts "Corpo do e-mail: #{corpo} \n"
    end
end
  
class OutlookProvider < EmailProvider
    def enviar_email(para, assunto, corpo)
        puts "Enviando e-mail pelo Outlook"
        puts "Para: #{para} \n"
        puts "Assunto: #{assunto} \n"
        puts "Corpo do e-mail: #{corpo} \n"
    end
end
  
# Abstração: Cliente de e-mail
class EmailClient
    attr_reader :email_provider
  
    def initialize(email_provider)
        @email_provider = email_provider
    end
  
    def enviar_email(para, assunto, corpo)
        raise NotImplementedError, "Método 'enviar_email' deve ser implementado na classe filha"
    end
end
  
  # Abstrações concretas
class EmailClientGmail < EmailClient
    def enviar_email(para, assunto, corpo)
        puts "Cliente de e-mail do Gmail"
        email_provider.enviar_email(para, assunto, corpo)
    end
end
  
class EmailClientOutlook < EmailClient
    def enviar_email(para, assunto, corpo)
        puts "Cliente de e-mail do Outlook"
        email_provider.enviar_email(para, assunto, corpo)
    end
end
  
# Exemplo de uso
gmail_provider = GmailProvider.new
outlook_provider = OutlookProvider.new

gmail_client = EmailClientGmail.new(gmail_provider)
outlook_client = EmailClientOutlook.new(outlook_provider)

gmail_client.enviar_email("exemplo@gmail.com", "Olá", "Este é um e-mail de exemplo pelo Gmail")
outlook_client.enviar_email("exemplo@outlook.com", "Olá", "Este é um e-mail de exemplo pelo Outlook")