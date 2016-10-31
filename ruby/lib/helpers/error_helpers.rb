module ErrorHelpers
  MISSING_QUERY_PARAMS = "Missing query params"
  KEY_EXISTS = "Key exists"

  def halt_with_422(message = MISSING_QUERY_PARAMS)
    halt(422, message)
  end

  def halt_with_400(message = KEY_EXISTS)
    halt(400, message)
  end
end
