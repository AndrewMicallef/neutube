#include "flyemsplitcontrolform.h"

#include <iostream>
#include "ui_flyemsplitcontrolform.h"

FlyEmSplitControlForm::FlyEmSplitControlForm(QWidget *parent) :
  QWidget(parent),
  ui(new Ui::FlyEmSplitControlForm)
{
  ui->setupUi(this);

  setupWidgetBehavior();
}

FlyEmSplitControlForm::~FlyEmSplitControlForm()
{
  delete ui;
}

void FlyEmSplitControlForm::setupWidgetBehavior()
{
  connect(ui->exitPushButton, SIGNAL(clicked()), this, SIGNAL(exitingSplit()));
  connect(ui->quickViewPushButton, SIGNAL(clicked()),
          this, SIGNAL(quickViewTriggered()));
  connect(ui->viewResultQuickPushButton, SIGNAL(clicked()),
          this, SIGNAL(splitQuickViewTriggered()));
  connect(ui->view3dBodyPushButton, SIGNAL(clicked()),
          this, SIGNAL(bodyViewTriggered()));
  connect(ui->viewSplitPushButton, SIGNAL(clicked()),
          this, SIGNAL(splitViewTriggered()));
//  connect(ui->quickViewPushButton, SIGNAL(clicked()), this, SLOT(slotTest()));
}

void FlyEmSplitControlForm::slotTest()
{
  std::cout << "slot triggered." << std::endl;
}

void FlyEmSplitControlForm::setSplit(uint64_t bodyId)
{
  ui->bodyIdSpinBox->setValue(bodyId);
}
