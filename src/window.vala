public class PushJet.Window : Gtk.ApplicationWindow {

  private Gtk.Widget content;

  construct {
    this.delete_event.connect(destroy_app);
    this.content = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
    this.set_default_size(
      PushJet.STATE.window_width, PushJet.STATE.window_height
    );

    this.content = new PushJet.WelcomeView();

    this.add(content);
  }

  private bool destroy_app() {
    if (PushJet.SETTING.hide_close) {
		  this.hide();
			return true;
		} else {
			int width, height;
			get_size (out width, out height);
			PushJet.STATE.window_width = width;
      PushJet.STATE.window_height = height;
			return false;
		}
  }
}
