module ErrorHelpers
  KEY_NOT_FOUND = "Please set a valid key"

  def halt_with_422(message = KEY_NOT_FOUND)
    halt(422, message)
  end
end
