Adding CRUD's based on *onebase* and the *AceEditor* in 3 different ways:
-------------------------------------------------------------------------


##1. Via superviews


`app/src/extensions/onebase/core/superviews`


Add a file here and it will overwrite everything else.
   
<br>  
   
---

##2. Via EditorProvider


`app/src/extensions/onebase/config/giiant.php`

<br>

    \Yii::$container->set(        
         'schmunk42\giiant\generators\crud\providers\EditorProvider',        
         ['columnNames' => ['configuration'],       
          'widget' => 'nameofyouradditiondesire'        
         ]
    );

`app/vendor/schmunk42/yii2-giiant/src/generators/crud/providers/EditorProvider.php`

<br>

    case 'configuration_blub':
    $this->generator->requires[] = 'trntv/aceeditor';
    return "\$form->field(\$model, '{$attribute}')->widget(\\trntv\\aceeditor\\AceEditor::className())";
    break;
    default:
    $this->generator->requires[] = 'trntv/aceeditor';
    
<br>

---
   
##3. Via CallbackProvider 
  
TBD.

<br>

---
