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
      "add",
      "Add an UUID",
      "Set up an UUID to receive your notifications"
    );
  }
}
