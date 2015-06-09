namespace PushJet {
  internal App APP;
}

public class PushJet.App : Granite.Application {

  private PushJet.Window window = null;

  construct {
    build_data_dir = Build.DATADIR;
    build_pkg_data_dir = Build.PKGDATADIR;
    build_release_name = Build.RELEASE_NAME;
    build_version = Build.VERSION;
    build_version_info = Build.VERSION_INFO;

    program_name = "PushJet";
    exec_name = "pushjet";

    app_copyright = "2015";
    application_id = "org.pantheon.pushjet";
    app_icon = "pushjet";
    app_launcher = "pushjet.desktop";
    app_years = "2015";

    main_url = "https://dam0un.github.io/pushjet-gtk";
    bug_url = "https://github.com/dam0un/pushjet-gtk/issues";
    help_url = "https://github.com/dam0un/pushjet-gtk/wiki";
    translate_url = "https://github.com/dam0un/pushjet-gtk";

    about_authors = { "Damien Plenard <damien@plenard.me>" };
    about_license_type = Gtk.License.MIT_X11;
  }

  public App() {
    Granite.Services.Logger.initialize("PushJet");
    Granite.Services.Logger.DisplayLevel = Granite.Services.LogLevel.DEBUG;
    Granite.Services.Logger.notification("Application Started");
  }

  protected override void activate() {
		if (this.window != null) {
      this.window.present();
			return;
		}
		this.window = new PushJet.Window();
    this.window.title = "PushJet";
		this.window.icon_name = "pushjet-icon";
		this.window.set_application(this);
		this.window.show_all();
	}

  public static int main(string[] args) {
    PushJet.APP = new PushJet.App();
    return PushJet.APP.run(args);
  }
}
