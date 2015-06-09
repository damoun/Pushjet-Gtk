public class PushJet.Window : Gtk.ApplicationWindow {

  private Gtk.Widget content;

  construct {
    this.content = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);

    this.content = new PushJet.WelcomeView();

    this.add(content);
  }
}
