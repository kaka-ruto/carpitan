import { application } from "./application";
import controllers from "./**/*_controller.js";

controllers.forEach((controller) => {
  application.register(controller.name, controller.module.default);
});

import HwComboboxController from "@josefarias/hotwire_combobox";
application.register("hw-combobox", HwComboboxController);
