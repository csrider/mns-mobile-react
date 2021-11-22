import HeaderBar from "./HeaderBar";
import * as Values from "../Values.js";

function AppHeader() {
  return (
    <div id="app-header-container">
      <HeaderBar text={Values.appName} menuType={Values.menuTypes.mainApp} />
    </div>
  );
}

export default AppHeader;
