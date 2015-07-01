/**
 Sunny软件公司欲开发一套界面皮肤库，可以对Java桌面软件进行界面美化。为了保护版权，该皮肤库源代码不打算公开，而只向用户提供已打包为jar文件的class字节码文件。用户在使用时可以通过菜单来选择皮肤，不同的皮肤将提供视觉效果不同的按钮、文本框、组合框等界面元素.
 该皮肤库需要具备良好的灵活性和可扩展性，用户可以自由选择不同的皮肤，开发人员可以在不修改既有代码的基础上增加新的皮肤。
 */

#import <Foundation/Foundation.h>
#import "SkinFactory.h"
#import "Button.h"
#import "TextField.h"
#import "ComboBox.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SkinFactory *skinFactory = [SkinFactory factory];
        Button *btn = [skinFactory createButton];
        TextField *tf = [skinFactory createTextField];
        ComboBox *box = [skinFactory createComboBox];
        [btn display];
        [tf display];
        [box display];
    }
    return 0;
}
