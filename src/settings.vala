public class PushJet.State : Granite.Services.Settings {

  public int window_width { get; set; }
  public int window_height { get; set; }

  public State() {
    base("org.pantheon.pushjet.state");
  }
}

public class PushJet.Settings : Granite.Services.Settings {

  public bool hide_close { get; set; }
  public bool hide_start  { get; set; }
  public bool enable_notification { get; set; }
  public string uuid { get; set; }

  public Settings() {
    base("org.pantheon.pushjet.settings");
  }
}

public class PushJet.Service : Granite.Services.Settings {

  public string icon { get; set; }
  public string name { get; set; }
  public string public_key { get; set; }
  public string private_key { get; set; }
  public bool enable_notification { get; set; }

  public Service() {
    base("org.pantheon.pushjet.service");
  }
}
