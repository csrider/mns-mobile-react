export const appName = "MNS Connections Mobile"

export const menuTypes = {
  mainApp: "mainApp",
  messageSection: "messageSection",
  messageItem: "messageItem",
};


//=========================================================
// The following is dummy data for demonstrating front-end.
// In reality, this would pull from the Connections server.

export const sections = [
  { key: 0, name: "My Favorites" },
  { key: 1, name: "Emergency" },
];

export const messages = [
  { key: 0, name: "Msg 1", sectionKey: 1, icon: "" },
  { key: 1, name: "Msg 2", sectionKey: 0, icon: "" },
  { key: 2, name: "Msg 3", sectionKey: 0, icon: "" },
  { key: 3, name: "Msg 4", sectionKey: 1, icon: "" },
  { key: 4, name: "Msg 5", sectionKey: 0, icon: "" },
];
