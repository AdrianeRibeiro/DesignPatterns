//Exemplo para fins educativos retirado de https://www.branas.io/blog/design-patterns-prototype.html
//Uso dos padrões: Prototype, Repository, Factory, Singleton 

interface FormRepository {
    save(form: Form): Promise<void>;
    get(formId: string): Promise<Form>;
}

interface Prototype {
    clone (): Prototype;
}

interface FormFactory {
    createLeadCaptureForm(category: string, description: string): Form;
}

type Input = {
    fromFormId: string;
    category: string;
    description: string;
}

class Field implements Prototype {
    fieldId: string;

    constructor(public type: string, public title: string) {
        this.fieldId = crypto.randomUUID();
    }

    clone(): Field {
        return new Field(this.type, this.title);
    }
}

class Form implements Prototype {
    formId: string;
    fields: Field[];

    constructor(public category: string, public description: string) {
        this.formId = crypto.randomUUID();
        this.fields = [];
    }

    addField(type: string, title: string) {
        this.fields.push(new Field(type, title));
    }

    removeField(fieldId: string) {
        const index = this.fields.findIndex(field => field.fieldId === fieldId);
        this.fields.splice(index, 1);
    }

    clone(): Form {
        const fields: Field[] = [];
        for (const field of this.fields) {
            fields.push(field.clone());
        }

        const form = new Form(this.category, this.description);
        form.fields = fields;
        return form;
    }
}


class CopyForm {
    constructor(readonly formRepository: FormRepository) {}

    async execute(input: Input): Promise<void> {
        const form = await this.formRepository.get(input.fromFormId);
        const newForm = await form.clone();
        newForm.category = input.category;
        newForm.description = input.description;
        await this.formRepository.save(newForm);
    }
}

class PrototypeFormFactory implements FormFactory {

    createLeadCaptureForm(category: string, description: string): Form {
        const leadCaptureForm = new Form(category, description);
        leadCaptureForm.addField("name", "text");
        leadCaptureForm.addField("email", "text");
        return leadCaptureForm.clone();
    }
}

const formFactory = new PrototypeFormFactory();
const newFormF = formFactory.createLeadCaptureForm("Marketing", "Lead Capture");

//Singleton
class PrototypeManager {
    private prototypes: {};
    static instance: PrototypeManager;

    add(name: string, prototype: Prototype) {
        this.prototypes[name] = prototype;
    }

    get(name: string) {
        return this.prototypes[name];
    }

    static getInstance() {
        if(!PrototypeManager.instance) {
            PrototypeManager.instance = new PrototypeManager()
        }
        
        return PrototypeManager.instance;
    }
}

const leadCaptureForm = new Form("Marketing", "Lead Capture");
leadCaptureForm.addField("name", "text");
leadCaptureForm.addField("email", "text");

PrototypeManager.getInstance().add("leadCaptureForm", leadCaptureForm);
const newFormS = PrototypeManager.getInstance().get("leadCaptureForm").clone();