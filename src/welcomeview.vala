public class PushJet.WelcomeView : Granite.Widgets.Welcome {

  public WelcomeView() {
    base(
      "Receive notifications",
      "You have not configured any UUID yet."
    );
    this.build_ui();
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
}
