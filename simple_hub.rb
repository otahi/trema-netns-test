class SimpleHub < Trema::Controller
  def switch_ready(dpid)
    send_flow_mod_add(
      dpid,
      match: Match.new,
      actions: SendOutPort.new(:flood)
    )
  end
end
