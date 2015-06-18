public class PushJet.WelcomeView : Granite.Widgets.Welcome {

  public WelcomeView() {
    base(
      "Receive notifications",
      "You have not configured any UUID yet."
    );
    this.build_ui();
    this.bind_ui();
  }

  private void build_ui() {
    this.append(
      "document-new",
      "Create",
      "Create a new UUID to receive notifications"
    );
    this.append(
      "document-import",
      "Import",
      "Import an existing UUID to receive notifications"
    );
  }

  private void bind_ui() {
    this.activated.connect((idx) => {
      switch (idx) {
        case 0:
          this.create_uuid();
          break;
        case 1:
          this.import_uuid();
          break;
        default:
          assert_not_reached();
      }
    });
  }

  private void create_uuid() {

  }

  private void import_uuid() {
    PushJet.UUIDWindow uuid = new PushJet.UUIDWindow();
    uuid.show_all();
  }
}
