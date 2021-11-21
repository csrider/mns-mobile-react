/* A header bar generally consists of:
 * - Text title left-aligned
 * - Menu or other functional icons right-aligned
 */

import * as Values from "../Values.js";
import { useState } from "react";
import Modal from "./Modal.js";
import Backdrop from "./Backdrop.js";

function HeaderBar(props) {
  const [modalIsOpen, setModalIsOpen] = useState(false);
  const [sectionIsCollapsed, setSectionIsCollapsed] = useState(false);

  function mainMenuHandler() {
    setModalIsOpen(true);
  }

  function sectionMenuHandler() {
    setModalIsOpen(true);
  }

  function closeModalHandler() {
    setModalIsOpen(false);
  }

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

      {props.menuType === Values.menuTypes.mainApp ? (
        <button class="btn header-menu" onClick={mainMenuHandler}>
          Main Menu
        </button>
      ) : null}
      {props.menuType === Values.menuTypes.messageSection ? (
        <span>
          <button class="btn header-menu" onClick={sectionMenuHandler}>
            Options
          </button>

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

      {modalIsOpen ? (
        <Modal onCancel={closeModalHandler} onConfirm={closeModalHandler} />
      ) : null}
      {modalIsOpen ? <Backdrop onCancel={closeModalHandler} /> : null}
    </div>
  );
}

export default HeaderBar;
