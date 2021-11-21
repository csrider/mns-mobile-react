/* A header bar generally consists of:
 * - Text title left-aligned
 * - Menu or other functional icons right-aligned
 */

import * as Values from "../Values.js";
import { useState } from "react";
import Modal from "./Modal.js";
import Backdrop from "./Backdrop.js";

function HeaderBar(props) {
  // Control our modal, beginning with it invisible...
  // useState returns two elements (curr state and fxn is setter to change it)
  // The setter then re-executes this component
  const [modalIsOpen, setModalIsOpen] = useState(false);

  function mainMenuHandler() {
    setModalIsOpen(true);
  }

  function sectionMenuHandler() {
    setModalIsOpen(true);
  }

  function closeModalHandler() {
    setModalIsOpen(false);
  }

  function collapseSectionHandler() {}

  return (
    <div className="header-bar" id="app-title-container">
      <h1 className="header-text">{props.text}</h1>

      {props.menuType === Values.menuTypes.mainApp ? (
        <button class="btn header-menu" onClick={mainMenuHandler}>
          Main Menu
        </button>
      ) : null}
      {props.menuType === Values.menuTypes.messageSection ? (
        <button class="btn header-menu" onClick={sectionMenuHandler}>
          Options
        </button>
      ) : null}
      {props.menuType === Values.menuTypes.messageSection ? (
        <button class="btn header-menu" onClick={collapseSectionHandler}>
          Collapse
        </button>
      ) : null}

      {modalIsOpen ? <Modal onCancel={closeModalHandler} onConfirm={closeModalHandler} /> : null}
      {modalIsOpen ? <Backdrop onCancel={closeModalHandler} /> : null}
    </div>
  );
}

export default HeaderBar;
