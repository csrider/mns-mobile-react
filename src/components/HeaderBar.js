/* A header bar generally consists of:
 * - Text title left-aligned
 * - Menu or other functional icons right-aligned
 */

import * as Values from "../Values.js";
import { useState } from "react";

function HeaderBar(props) {
  const [sectionIsCollapsed, setSectionIsCollapsed] = useState(false);

  function collapseSectionHandler(e) {
    const msgItemContainer = document.getElementById(
      "messages-container-" + props.sectionKey
    );

    if (sectionIsCollapsed) {
      msgItemContainer.style.display = "block";
      setSectionIsCollapsed(false);
    } else {
      msgItemContainer.style.display = "none";
      setSectionIsCollapsed(true);
    }
  }

  return (
    <div className="header-bar" id="app-title-container">
      <h1 className="header-text">{props.text}</h1>

      {props.menuType === Values.menuTypes.mainApp &&
      Values.config.enableMainMenu ? (
        <button class="btn header-menu">Main Menu</button>
      ) : null}
      {props.menuType === Values.menuTypes.messageSection ? (
        <span>
          {Values.config.enableSectionMenu ? (
            <button class="btn header-menu">Options</button>
          ) : null}

          {sectionIsCollapsed ? (
            <button class="btn header-menu" onClick={collapseSectionHandler}>
              Expand
            </button>
          ) : (
            <button class="btn header-menu" onClick={collapseSectionHandler}>
              Collapse
            </button>
          )}
        </span>
      ) : null}
    </div>
  );
}

export default HeaderBar;
