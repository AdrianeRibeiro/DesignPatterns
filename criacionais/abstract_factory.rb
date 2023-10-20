# Exemplo adaptado de https://refactoring.guru/pt-br/design-patterns/abstract-factory

# Interface da fábrica abstrata
class UIFactory
  def create_button
    not_implemented_error
  end

  def create_input
    not_implemented_error
  end

  private

  def not_implemented_error
    raise NotImplementedError, 'Subclasses must implement this method'
  end
end

# Implementação da fábrica concreta
class WebFactory < UIFactory
  def create_button
    WebButton.new
  end

  def create_input
    WebInput.new
  end
end

# Implementação da fábrica concreta
class MobileFactory < UIFactory
  def create_button
    MobileButton.new
  end

  def create_input
    MobileInput.new
  end
end

# Interface para os produtos de Button
class Button
  def render
    not_implemented_error
  end

  private

  def not_implemented_error
    raise NotImplementedError, 'Subclasses must implement this method'
  end
end

# Implementação do botão para Web
class WebButton < Button
  def render
    'Render a Button for Web'
  end
end

# Implementação do botão para Mobile
class MobileButton < Button
  def render
    'Render Button for Mobile'
  end
end

# Interface para os produtos Input
class Input
  def render
    not_implemented_error
  end

  private

  def not_implemented_error
    raise NotImplementedError, 'Subclasses must implement this method'
  end
end

# Implementação do input para Web
class WebInput < Input
  def render
    'Render a Input for Web'
  end
end

# Implementação do input para Mobile
class MobileInput < Input
  def render
    'Render a Input for Mobile'
  end
end

# Cliente que usa a fábrica abstrata
class Application
  def initialize(factory)
    @factory = factory
  end

  def create_ui
    button = @factory.create_button
    input = @factory.create_input
    puts button.render
    puts input.render
  end
end

class Client
  def main(device)
    factory = device == 'mobile' ? MobileFactory.new : WebFactory.new

    app = Application.new(factory)
    app.create_ui
  end
end

# Exemplo de uso
Client.new.main('mobile')
Client.new.main('web')
