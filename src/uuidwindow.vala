public class PushJet.UUIDWindow : Gtk.Dialog {

  private Gtk.Entry uuid;

  public UUIDWindow() {
    this.title = "Import an existing UUID";
    this.window_position = Gtk.WindowPosition.CENTER;
    this.type_hint = Gdk.WindowTypeHint.DIALOG;
    this.destroy_with_parent = true;
    this.set_modal(true);

    this.set_transient_for(PushJet.APP.get_active_window());

    this.build_ui();
    this.bind_ui();
  }

  private void build_ui() {
    this.uuid = new Gtk.Entry();
    this.uuid.set_text(PushJet.SETTING.uuid);

    var u_label = new Gtk.Label("");
    u_label.set_markup("<b>%s</b>".printf("UUID"));
    u_label.set_halign(Gtk.Align.START);

    Gtk.Box content = (Gtk.Box)this.get_child();
    content.pack_start(u_label, false, true, 0);
    content.pack_start(this.uuid, true, true, 0);
  }

  private void bind_ui() {
    this.delete_event.connect(this.destroy_window);
  }

  private bool destroy_window() {
    PushJet.SETTING.uuid = this.uuid.get_text();
    return false;
  }
}
