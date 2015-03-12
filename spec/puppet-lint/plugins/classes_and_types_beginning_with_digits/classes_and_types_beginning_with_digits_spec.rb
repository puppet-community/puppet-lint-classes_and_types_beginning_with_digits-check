require 'spec_helper'

describe 'classes_and_types_beginning_with_digits' do
  let (:msg) { 'class or defined type found beginning with a digit' }

  context 'with fix disabled' do
    context 'no classes or defined types that begin with digits' do
      let (:code) {
        <<-EOS
        class apache {}
        define virtualhost {}
        class rule_10 {}
        define rule_34 {}
        EOS
      }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end

    context 'unquoted numbers with leading zero' do
      let (:code) {
        <<-EOS
        class 0apache {}
        define 3virtualhost {}
        class 01234apache {}
        define 3456virtualhost {}
        EOS
      }

      it 'should detect a single problem' do
        expect(problems).to have(4).problems
      end

      it 'should create a warning' do
        expect(problems).to contain_warning(msg).on_line(1).in_column(9)
      end
    end
  end

  context 'with fix enabled' do
    before do
      PuppetLint.configuration.fix = true
    end

    after do
      PuppetLint.configuration.fix = false
    end

    context 'no unquoted numbers with leading zero' do
      let (:code) {
        <<-EOS
        class apache {}
        define virtualhost {}
        class rule_10 {}
        define rule_34 {}
        EOS
      }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end

      it 'should not modify the manifest' do
        expect(manifest).to eq(code)
      end
    end

    context 'unquoted numbers with leading zero' do
      let (:code) {
        <<-EOS
        class 0apache {}
        define 3virtualhost {}
        class 01234my_apache {}
        define 3456my_virtualhost {}
        EOS
      }

      it 'should detect a single problem' do
        expect(problems).to have(4).problems
      end

      it 'should fix the problem' do
        expect(problems).to contain_fixed(msg).on_line(1).in_column(9)
      end

      it 'should should use undef' do
        expect(manifest).to eq(
          <<-EOS
        class apache {}
        define virtualhost {}
        class my_apache {}
        define my_virtualhost {}
          EOS
        )
      end
    end
  end
end
